module Variables

end

ActiveSupport.on_load(:active_record) do 
  unless Object.const_defined? 'Variable'
    klass = Class.new(ActiveRecord::Base) do
      set_table_name 'variables'

      def self.set(name, value)
        unless Variable.table_exists? 
          ActiveRecord::Schema.define do 
            create_table :variables do |t| 
              t.string :name 
              t.text   :value
              t.timestamps
            end
          end 
        end 

        record = find_by_name(name)
        if record
          record.update_attribute(:value, [value].to_json)
        else
          create(:name => name, :value => [value].to_json)
        end
      end
    
      def self.get(name)
        record = find_by_name(name)
        return nil unless record
        ActiveSupport::JSON.decode(record.value).first
      end

    end
    Object.const_set 'Variable', klass
  end

end
