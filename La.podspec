Pod::Spec.new do |spec|
  spec.name = 'La'
  spec.version = '0.6.0'
  spec.homepage = 'https://github.com/mitsuse/la'
  spec.authors = {
    'Tomoya Kose' => 'tomoya@mitsuse.jp'
  }
  spec.summary = 'A library for linear algebra with type-safety written in Swift.'
  spec.source = { :git => 'https://github.com/mitsuse/la.git' }
  spec.ios.deployment_target = '8.0'
  spec.source_files = 'Sources/*.swift'
end
