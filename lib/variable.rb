module Variable 

  DIR = File.join(Rails.root, 'tmp', 'variables')

  def set(name, value)
    File.open(File.join(DIR, name), 'w') { |f| 
      f.flock File::LOCK_EX
      f.write [value].to_json 
    }
  end

  def get(name)
    value = nil
    File.open(File.join(DIR, name), 'r') { |f| 
      value = ActiveSupport::JSON.decode(f.read).first 
    }
    value
  end

end
