Pod::Spec.new do |s|
  s.name         = "NSDate-RelativeTime"
  s.version      = "0.2.0"
  s.summary      = "An NSDate category to generate relative time strings from dates"
  s.description  = <<-DESC
Date-RelativeTime
===================

An `NSDate` category to generate relative time (or fuzzy time) strings from
dates.

## Usage
* Call the `relativeTime` method on an NSDate to get the relative time.

## Tests
The tests are in `NSDate+RelativeTimeTests.m` and require Kiwi to run.
  DESC

  s.homepage     = "http://github.com/bartj3/nsdate-relativetime"
  s.license      = { type: 'MIT', file: 'LICENSE' }
  s.author       = { "Bart van Zon" => "bartvanzon@gmail.com" }
  s.source       = { git: "https://github.com/bartj3/NSDate-RelativeTime.git", tag: "0.2.0" }
  s.source_files = 'NSDate+RelativeTime.h', 'NSDate+RelativeTime.m'
  s.resources    = 'NSDate+RelativeTime.bundle'
end
