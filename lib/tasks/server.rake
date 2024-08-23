# frozen_string_literal: true

task :server do
  sh "rails server -b 0.0.0.0"
end