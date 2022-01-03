
  Pod::Spec.new do |s|
    s.name = 'CapacitorHealthkit'
    s.version = '0.1.3'
    s.summary = 'Capacitor plugin to retrieve data from Healthkit'
    s.license = 'MIT'
    s.homepage = 'https://github.com/Ad-Scientiam/capacitor-healthkit.git'
    s.author = 'Ad Scientiam'
    s.source = { :git => 'https://github.com/Ad-Scientiam/capacitor-healthkit.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '12.0'
    s.dependency 'Capacitor'
    s.swift_version = '5.1'
  end
