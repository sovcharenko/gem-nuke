require 'rubygems/version_option'
require 'rubygems/uninstaller'

module Gem
  module Commands
    class NukeCommand < Gem::Command
      def initialize
        super 'nuke', description

        add_option('-v', '--vault gemname1,gemname2', Array,
                   "Gems in vault that'll survive this command") do |vault, options|
          options[:vault] = vault
        end
      end

      def arguments # :nodoc:
        ''
      end

      def usage # :nodoc:
        program_name.to_s
      end

      def defaults_str # :nodoc:
        ''
      end

      def description # :nodoc:
        'Nukes gems. The ones in vault will survive.'
      end

      def execute
        options[:vault] ||= []

        specs_to_uninstall = Gem::Specification.reject { |spec| options[:vault].include?(spec.name) }

        specs_to_uninstall.each do |spec|
          begin
            Gem::Uninstaller.new(spec.name, {
                force: true,
                executables: true
            }).uninstall
            puts spec.name
          rescue StandardError
            # ignored
          end
        end
      end
    end
  end
end
