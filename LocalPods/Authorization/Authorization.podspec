#
# Be sure to run `pod lib lint Authorization.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Authorization'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Authorization.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/kurban.min@mail.ru/Authorization'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kurban.min@mail.ru' => 'kurban.min@mail.ru' }
  s.source           = { :git => 'https://github.com/kurban.min@mail.ru/Authorization.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Authorization/Sources/**/*'
  
  s.resource = 'Example/Authorization/*.{xcassets,json,imageset,png,pdf,strings,stringsdict,html,otf,ttf}'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'KeychainAccess'
  s.dependency 'PinLayout'
  s.dependency 'RxSwift'
  s.dependency 'Dip'
  s.dependency 'RxCocoa'
  s.dependency 'R.swift'

  r_swift_script = '"${PODS_ROOT}/R.swift/rswift" generate "${PODS_TARGET_SRCROOT}/Authorization/Sources/R.generated.swift"'
  r_input = "${TEMP_DIR}/rswift-lastrun"
  r_output = "${PODS_TARGET_SRCROOT}/Authorization/Sources/R.generated.swift"
  s.script_phases = [
      {
          :name => 'R.swift',
          :script => r_swift_script,
          :input_files => [r_input],
          :output_files => [r_output],
          :execution_position => :before_compile
      }
  ]
end
