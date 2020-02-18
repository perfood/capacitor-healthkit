
  Pod::Spec.new do |s|
    s.name = 'CapacitorHealthkit'
    s.version = '0.0.3'
    s.summary = 'Capacitor plugin to retrieve data from Healthkit'
    s.license = 'MIT'
    s.homepage = 'https://github.com/Ad-Scientiam/capacitor-healthkit.git'
    s.author = 'Ad Scientiam'
    s.source = { :git => 'https://github.com/Ad-Scientiam/capacitor-healthkit.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end