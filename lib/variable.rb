class Variable < ActiveRecord

  def self.set(name, value)
    update_all({ :name => name }, { :value => [value].to_json })
  end

  def self.get(name)
    ActiveSupport::JSON.decode(find_by_name(name)).first
  end

end

ActiveSupport.on_load(:active_record) do 
#  unless Object.const_defined? 'Variable'
#    klass = Class.new(ActiveRecord::Base) do
#      set_table_name 'variables'
#    end
#    Object.const_set 'Variable', klass
#  end

  unless Variable.table_exists? 
    ActiveRecord::Schema.define do 
      create_table :variables do |t| 
        t.string :name 
        t.text   :value
        t.timestamps
      end
    end 
  end 
end
