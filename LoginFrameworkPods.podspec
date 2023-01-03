Pod::Spec.new do |spec|
  spec.name         = "LoginFrameworkPods"
  spec.version      = "1.1.0"
  spec.summary      = "A reusable log in framework"
  spec.description  = "Create a reusable log in framework: login details can be stubbed, UI should be customizable."
  spec.homepage     = "https://github.com/oliver-anh-nguyen/swift_login_framework"
  spec.license      = "MIT"
  spec.author             = { "tuan.anh.nguyen" => "oliver.anh.nguyen@gmail.com" }
  spec.platform     = :ios, "15.5"
  spec.source       = { :git => "https://github.com/oliver-anh-nguyen/swift_login_framework.git", :tag => spec.version.to_s }
  spec.source_files  = "LoginFramework/**/*.{swift,xib}"
  spec.resources = "LoginFramework/**/Resources/*.png"
  spec.swift_version = "5.0"
end
