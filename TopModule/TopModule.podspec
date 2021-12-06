Pod::Spec.new do |spec|

  spec.name         = "TopModule"
  spec.version      = "1.0.0"
  spec.summary      = "Top module for MVVM architecture"
  spec.description  = "This is the best of the best module. Creating by Crab Code"
  spec.homepage     = "https://github.com/crabcodeinc/TopModule"
  spec.license     = "MIT"
  spec.author       = { "Crab Code" => "crabcodeinc@gmail.com" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/crabcodeinc/TopModule.git", :branch => "main", :tag => "1.0.0" }
  spec.source_files = "TopModule/*"
  spec.swift_version = '4.0'
end
