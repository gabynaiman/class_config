require 'minitest_helper'

describe ClassConfig do

  class Configurable
    extend ClassConfig
    attr_config :with_default, 'default value'
    attr_config :without_default
    attr_config :setting
  end

  before do
    Configurable.restore_default_configuration
  end
  
  it 'With default' do
    Configurable.with_default.must_equal 'default value'
  end

  it 'Without default' do
    Configurable.without_default.must_be_nil
  end

  it 'Get/Set' do
    Configurable.setting.must_be_nil
    Configurable.setting = :some_value
    Configurable.setting.must_equal :some_value
  end

  it 'Restore defaults' do
    Configurable.with_default = :value_1
    Configurable.without_default = :value_2
    Configurable.setting = :value_3

    Configurable.restore_default_configuration

    Configurable.with_default.must_equal 'default value'
    Configurable.without_default.must_be_nil
    Configurable.setting.must_be_nil
  end

  it 'Dump configuration' do
    Configurable.setting = :dump

    Configurable.configuration.must_equal with_default: 'default value',
                                          without_default: nil,
                                          setting: :dump
  end

  it 'Configure block' do
    Configurable.configure do |config|
      config.setting = :config_block
    end

    Configurable.setting.must_equal :config_block
  end

end