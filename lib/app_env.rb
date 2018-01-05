module AppEnv
  extend self

  def [](key)
    key = key.to_s.upcase
    ENV[key]
  end

  def fb(key)
    fetch "fb_#{key}".to_sym
  end

  def fetch(key)
    self[key] or raise(IndexError, "#{key} missing from config", caller)
  end

  def guarded?
    self[:guard_name] && self[:guard_password]
  end

  def requires(*keys)
    keys.each do |key|
      unless self[key]
        raise RuntimeError, "AppEnv[#{key.inspect}] is required but missing", caller
      end
    end
  end

  def url(key)
    URI.parse(fetch("#{key}_url"))
  end

  def background(job, *args)
    if AppEnv[:enable_backgrounding]
      Resque.enqueue(job, *args)
    else
      job.perform(*args)
    end
  end

  def paperclip_storage
    s3[:production]
  end

  def s3
    production = { bucket: self[:s3_bucket],
                   access_key_id: self[:s3_access_key_id],
                   secret_access_key: self[:s3_secret_access_key] }
    Hash.new({}).merge! production: { storage: :s3, s3_credentials: production }
  end

end
