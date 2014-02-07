module ClassConfig

  VERSION = '0.0.1'

  alias_method :configure, :tap

  def attr_config(name, default_value=nil)
    configuration_defaults[name.to_sym] = default_value

    define_singleton_method name do
      configuration[name.to_sym]
    end

    define_singleton_method "#{name}=" do |value|
      configuration_values[name.to_sym] = value
    end
  end

  def configuration
    configuration_defaults.merge configuration_values
  end

  def restore_default_configuration
    configuration_values.clear
  end

  private

  def configuration_defaults
    @configuration_defaults ||= {}
  end

  def configuration_values
    @configuration_values ||= {}
  end


end
