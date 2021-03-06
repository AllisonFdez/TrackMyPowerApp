class DynamicPagesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  def panels_report
    @user = current_user
    @page = Page.find_by(title:"PV Lab - Park10",dashboard:current_dashboard)
    @notifications = last_notifications
  end

  def wind_report
    @user = current_user
    @page = Page.find_by(title:"Mapuka - BLQ K",dashboard:current_dashboard)
    @notifications = last_notifications
  end

  def export_tables
    @user = current_user
    @page = Page.find_by(title:"Tables",dashboard:current_dashboard)
    @notifications = last_notifications
    @group = ActiveRecord::Base.connection.tables
    @electrical_variables = ElectricalMeasurement.column_names - ["id", "created_at"]
    @internal_variables = InternalConditionsMeasurement.column_names - ["id", "created_at"]
    @meteorological_variables = MeteorologicalMeasurement.column_names - ["id", "created_at"]
  end

  def alerts
    alerts_page = params[:alerts_page]
    notifications_page = params[:notifications_page]
    alerts_page = 1 if params[:alerts_page].nil?
    notifications_page = 1 if params[:notifications_page].nil?
    @user = current_user
    @page = Page.find_by(title:"Alerts",dashboard:current_dashboard)
    @notifications = last_notifications.paginate(page: notifications_page, per_page: 10)
    Notification.where(id: @notifications.pluck(:id)).update_all seen: true
    @alerts = @user.alerts.paginate(page: alerts_page, per_page: 10)
    @group = ActiveRecord::Base.connection.tables.sort_by(&:downcase)
    @electrical_variables = ElectricalMeasurement.column_names - ["id", "created_at","updated_at"]
  end

  def nodes
    @user = current_user
    @var = params[:id]
    render :file => "#{Rails.root}/app/views/dynamic_pages/nodes", :layout => false
    @notifications = last_notifications
  end
end
