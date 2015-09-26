VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassette_library'
  c.hook_into                :webmock
  c.ignore_localhost         = true
  c.default_cassette_options = {
    record: :none,
    preserve_exact_body_bytes: true
  }
  c.ignore_hosts 'codeclimate.com'
end
