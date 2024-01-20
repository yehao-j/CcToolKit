Pod::Spec.new do |s|

    s.name         = 'CcToolKit'
    s.version      = '1.0.0'
    s.summary      = '工具类'
    s.homepage     = 'https://github.com/J-yezi/CandyMoya'
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { "J-yezi" => 'yehao1020@gmail.com' }
    s.source       = { :git => 'https://github.com/J-yezi/CandyMoya.git', :tag => s.version }

    s.osx.deployment_target = '10.13'

    s.default_subspec = 'Core'

    s.subspec 'Core' do |ss|
        ss.source_files = 'Source/Core/*'
        ss.frameworks   = 'Cocoa'
    end

    s.subspec 'HandyJSON' do |ss|
        ss.source_files = 'Source/HandyJSON/*'
        ss.dependency 'HandyJSON', '5.0.2'
        ss.frameworks   = 'Cocoa'
    end

    s.subspec 'RxSwift' do |ss|
        ss.source_files = 'Source/RxSwift/*'
        ss.dependency 'RxSwift'
        ss.dependency 'RxCocoa'
        ss.frameworks   = 'Cocoa'
    end

    s.subspec 'Base' do |ss|
        ss.source_files = 'Source/Base/*'
        ss.frameworks   = 'Cocoa'
    end

end
