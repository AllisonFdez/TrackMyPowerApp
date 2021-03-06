class MeasurementsController < ApplicationController

#  before_action :authenticate

  before_action :logged_in_user, only: :new_notification
  before_action :correct_user, only: :new_notification
  layout 'blank'

  def new_electrical
    accepted = {}
    accepted[:voltage_med1] = params[:voltage_med1]
    accepted[:current_med1] = params[:current_med1]
    accepted[:energy_med1] = params[:energy_med1]
    accepted[:power_med1] = params[:power_med1]
    accepted[:pf_med1] = params[:pf_med1]
    accepted[:voltage_batt1] = params[:voltage_batt1]
    accepted[:voltage_batt2] = params[:voltage_batt2]
    @electrical_measurement = ElectricalMeasurement.new(accepted)
    attempt = @electrical_measurement.save
    if attempt
      create_notifications(ElectricalMeasurement)
      render html: "ElectricalMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_internal_conditions
    accepted = {}
    accepted[:temperature_int] = params[:temperature_int]
    accepted[:humidity_int] = params[:humidity_int]
    @internal_conditions_measurement = InternalConditionsMeasurement.new(accepted)
    attempt = @internal_conditions_measurement.save
    if attempt
      create_notifications(InternalConditionsMeasurement)
      render html: "InternalConditionsMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_panel_conditions
    accepted = {}
    accepted[:temp_ext] = params[:temp_ext]
    accepted[:temp_panel] = params[:temp_panel]
    accepted[:radiation] = params[:radiation]
    accepted[:voltage_panel] = params[:voltage_panel]
    accepted[:current_panel] = params[:current_panel]

    @panel_conditions_measurement = PanelConditionMeasurement.new(accepted)
    attempt = @panel_conditions_measurement.save
    if attempt
      create_notifications(PanelConditionMeasurement)
      render html: "PanelConditionMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_meteorological
    accepted = {}
    accepted[:temperature] = params[:temperature]
    accepted[:humidity] = params[:humidity]
    accepted[:wind_speed] = params[:wind_speed]
    accepted[:uv_index] = params[:uv_index]
    accepted[:solar_radiation] = params[:solar_radiation]
    accepted[:wind_direction] = params[:wind_direction]
    accepted[:created_at] = params[:created_at]
    @meteorological_measurement = MeteorologicalMeasurement.new(accepted)
    attempt = @meteorological_measurement.save
    if attempt
      create_notifications(MeteorologicalMeasurement)
      render html: "MeteorologicalMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_wind_turbine_speed
    accepted = {}
    accepted[:rpm] = params[:rpm]
    @wind_turbine_speed_measurement = WindTurbineSpeedMeasurement.new(accepted)
    attempt = @wind_turbine_speed_measurement.save
    if attempt
      create_notifications(WindTurbineSpeedMeasurement)
      render html: "WindTurbineSpeedMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_wind_turbine_vibration
    accepted = {}
    accepted[:m_ejex] = params[:m_ejex]
    accepted[:m_ejey] = params[:m_ejey]
    accepted[:m_ejez] = params[:m_ejez]
    @wind_turbine_vibration_measurement = WindTurbineVibrationMeasurement.new(accepted)
    attempt = @wind_turbine_vibration_measurement.save
    if attempt
      create_notifications(WindTurbineVibrationMeasurement)
      render html: "WindTurbineVibrationMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_wind_turbine_frequencies
    accepted = {}
    accepted[:mag] = params[:mag]
    accepted[:mag_y] = params[:mag_y]
    accepted[:mag_z] = params[:mag_z]
    accepted[:freq] = params[:freq]
    @wind_turbine_frequencies_measurement = WindTurbineFrequenciesMeasurement.new(accepted)
    attempt = @wind_turbine_frequencies_measurement.save
    if attempt
      create_notifications(WindTurbineFrequenciesMeasurement)
      render html: "WindTurbineFrequenciesMeasurements #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_panels_frequency
    accepted = {}
    accepted[:freqy] = params[:freqy]
    accepted[:pfactor] = params[:pfactor]
    @shark_panels_frequency_measurement = SharkPanelsFrequencyMeasurement.new(accepted)
    attempt = @shark_panels_frequency_measurement.save
    if attempt
      create_notifications(SharkPanelsFrequencyMeasurement)
      render html: "SharkPanelsFrequencyMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_panels_power
    accepted = {}
    accepted[:power_watt] = params[:power_watt]
    accepted[:power_va] = params[:power_va]
    accepted[:power_var] = params[:power_var]
    @shark_panels_power_measurement = SharkPanelsPowerMeasurement.new(accepted)
    attempt = @shark_panels_power_measurement.save
    if attempt
      create_notifications(SharkPanelsPowerMeasurement)
      render html: "SharkPanelsPowerMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_panels_energy
    accepted = {}
    accepted[:energy_watt] = params[:energy_watt]
    accepted[:energy_va] = params[:energy_va]
    accepted[:energy_var] = params[:energy_var]
    @shark_panels_energy_measurement = SharkPanelsEnergyMeasurement.new(accepted)
    attempt = @shark_panels_energy_measurement.save
    if attempt
      create_notifications(SharkPanelsEnergyMeasurement)
      render html: "SharkPanelsEnergyMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_panels_currents
    accepted = {}
    accepted[:current_a] = params[:current_a]
    accepted[:phase_a] = params[:phase_a]
    accepted[:current_b] = params[:current_b]
    accepted[:phase_b] = params[:phase_b]
    accepted[:current_c] = params[:current_c]
    accepted[:phase_c] = params[:phase_c]
    @shark_panels_currents_measurement = SharkPanelsCurrentsMeasurement.new(accepted)
    attempt = @shark_panels_currents_measurement.save
    if attempt
      create_notifications(SharkPanelsCurrentsMeasurement)
      render html: "SharkPanelsCurrentsMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_panels_line_voltages
    accepted = {}
    accepted[:voltage_ab] = params[:voltage_ab]
    accepted[:phase_ab] = params[:phase_ab]
    accepted[:voltage_bc] = params[:voltage_bc]
    accepted[:phase_bc] = params[:phase_bc]
    accepted[:voltage_ca] = params[:voltage_ca]
    accepted[:phase_ca] = params[:phase_ca]
    @shark_panels_line_voltages_measurement = SharkPanelsLineVoltagesMeasurement.new(accepted)
    attempt = @shark_panels_line_voltages_measurement.save
    if attempt
      create_notifications(SharkPanelsLineVoltagesMeasurement)
      render html: "SharkPanelsLineVoltagesMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_panels_phase_voltages
    accepted = {}
    accepted[:voltage_a] = params[:voltage_a]
    accepted[:voltage_b] = params[:voltage_b]
    accepted[:voltage_c] = params[:voltage_c]
    @shark_panels_phase_voltages_measurement = SharkPanelsPhaseVoltagesMeasurement.new(accepted)
    attempt = @shark_panels_phase_voltages_measurement.save
    if attempt
      create_notifications(SharkPanelsPhaseVoltagesMeasurement)
      render html: "SharkPanelsPhaseVoltagesMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_mapuka_powers
    accepted = {}
    accepted[:power_watt_mpk] = params[:power_watt_mpk]
    accepted[:power_va_mpk] = params[:power_va_mpk]
    accepted[:power_var_mpk] = params[:power_var_mpk]
    @shark_mapuka_powers_measurement = SharkMapukaPowersMeasurement.new(accepted)
    attempt = @shark_mapuka_powers_measurement.save
    if attempt
      create_notifications(SharkMapukaPowersMeasurement)
      render html: "SharkMapukaPowersMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_mapuka_energies
    accepted = {}
    accepted[:energy_watt_mpk] = params[:energy_watt_mpk]
    accepted[:energy_va_mpk] = params[:energy_va_mpk]
    accepted[:energy_var_mpk] = params[:energy_var_mpk]
    @shark_mapuka_energies_measurement = SharkMapukaEnergiesMeasurement.new(accepted)
    attempt = @shark_mapuka_energies_measurement.save
    if attempt
      create_notifications(SharkMapukaEnergiesMeasurement)
      render html: "SharkMapukaEnergiesMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_shark_mapuka_variables
    accepted = {}
    accepted[:voltage_mpk] = params[:voltage_mpk]
    accepted[:p_voltage] = params[:p_voltage]
    accepted[:current_mpk] = params[:current_mpk]
    accepted[:p_current] = params[:p_current]
    accepted[:freq_mpk] = params[:freq_mpk]
    accepted[:pf_mpk] = params[:pf_mpk]
    @shark_mapuka_variables_measurement = SharkMapukaVariablesMeasurement.new(accepted)
    attempt = @shark_mapuka_variables_measurement.save
    if attempt
      create_notifications(SharkMapukaEnergiesMeasurement)
      render html: "SharkMapukaVariablesMeasurement #{accepted} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your GET URL.", layout: true
    end
  end

  def new_wunderground
    station_id = 'IATLNTIC4'
    w_info = open("http://api.wunderground.com/api/606f3f6977348613/conditions/q/pws:#{station_id}.json")
    data = JSON.parse(w_info.read)["current_observation"]
    redirect_to controller: 'measurements', action: 'new_meteorological',
                temperature: data["temp_c"], humidity: data["relative_humidity"],
                wind_speed: data["wind_kph"], uv_index: data["UV"],
                solar_radiation: data["solarradiation"], wind_direction: data["wind_degrees"],
                created_at: data["observation_time_rfc822"]
  end

  def new_stream
    attempt = Stream.create(url: params[:url])
    if attempt
      render json: { msg: "Stream Image #{params[:url]} saved"}
    else
      render json: { msg: "Error saving to DB" }
    end
  end

  def new_notification
    notification_params = params.permit(:type,:title,:text)
    notification_params[:source] = current_user
    successful_saves = 0
    system_users = ["RaspberryPi","System","Arduino"]
    devices = system_users - ["System"]
    User.where.not(username: system_users).all.each do |user|
      notification_params[:user] = user
      notification = Notification.new(notification_params)
      attempt = notification.save
      if attempt
        successful_saves = successful_saves + 1
        last_notifications = user.notifications.order(created_at: :desc).first(5)
        UserMailer.new_notification(user, notification, last_notifications).deliver_later if notification.source.username.in?(devices)
      end
    end
    if successful_saves > 0
      render html: "#{successful_saves} #{'notification'.pluralize(successful_saves)} saved successfully!", layout: true
    else
      render html: "Error saving to DB. Please check your URL.", layout: true
    end
  end

   #private
     #def authenticate
      # if request.content_type.to_s.downcase != ENV['http_key'].downcase
       #  authenticate_or_request_with_http_basic('Administration') do |username, password|
        #   username == ENV['http_basic_user'] && password == ENV['http_basic_password']
         #end
       #end
     #end
end
