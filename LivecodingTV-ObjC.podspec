Pod::Spec.new do |s|
  s.name = 'Neon'
  s.version = '0.1'
  s.license = 'MIT'
  s.summary = 'A convenience library for anyone wanting to consume the Livecoding.tv REST API using Objective-C.'
  s.homepage = 'https://github.com/mamaral/LivecodingTV-ObjC'
  s.social_media_url = 'http://twitter.com/MikeAmaral'
  s.authors = { 'Mike Amaral' => 'mike.amaral36@gmail.com' }
  s.source = { :git => 'https://github.com/mamaral/LivecodingTV.ObjC.git', :tag => "v0.1" }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*'
  s.requires_arc = true
end
