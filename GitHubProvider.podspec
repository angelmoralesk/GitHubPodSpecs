Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "GitHubProvider"
s.summary = "Un framework para consumir GitHub"
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "TheKairuz" => "a.jesse3001@gmail.com" }

# For example,
# s.author = { "Joshua Greene" => "jrg.developer@gmail.com" }


# For example,
s.homepage = "https://github.com/ctime95/GitHubProvider"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "[Your RWPickFlavor Git URL Goes Here]", :tag => "#{s.version}"}

# For example,
# s.source = { :git => "https://github.com/ctime95/GitHubProvider.git", :tag => "#{s.version}"}


# 7

s.dependency 'Moya/RxSwift'


# 8
s.source_files = "GitHubProvider/**/*.{swift}"

# 9
s.resources = "GitHubProvider/**/*.{png,jpeg,jpg,storyboard,xib}"
end
