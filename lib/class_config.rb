module ClassConfig

  VERSION = '0.0.1'

  def attr_config(name, default_value=nil)
    configuration_defaults[name.to_sym] = default_value

    define_singleton_method name do
      configuration[name.to_sym]
    end

    define_singleton_method "#{name}=" do |value|
      configuration_values[name.to_sym] = value
    end
  end

  def configure(&block)
    tap &block
    @after_config_callback.call self if @after_config_callback
  end

  def after_config(&block)
    @after_config_callback = block
  end

  def configuration
    configuration_defaults.merge configuration_values
  end

  def restore_default_configuration
    configuration_values.clear
  end

  def inherited(subclass)
    %w(configuration_defaults configuration_values after_config_callback).each do |var|
      subclass.instance_variable_set "@#{var}", instance_variable_get("@#{var}")
    end
  end

  private

  def configuration_defaults
    @configuration_defaults ||= {}
  end

  def configuration_values
    @configuration_values ||= {}
  end

end