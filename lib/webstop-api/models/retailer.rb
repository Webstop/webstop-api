module WebstopApi
  class Retailer < Base
    attr_accessor :id, :name, :host, :email_to, :email_from, :main_stylesheet, :customizations_hash,
      :legacy_graphics_host_path, :legacy_site_path
  end
end
