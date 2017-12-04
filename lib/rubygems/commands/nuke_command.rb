require 'rubygems/version_option'
require 'rubygems/uninstaller'

module Gem
  module Commands
    class NukeCommand < Gem::Command
      def initialize
        super 'nuke', description

        add_option('-v', '--vault gemname1,gemname2', Array,
                   "Gems in vault that'll survive this command.") do |vault, options|
          options[:vault] = vault.reject(&:nil?).collect(&:strip)
        end
      end

      def description # :nodoc:
        'Nukes gems.'
      end

      def execute
        raise OptionParser::InvalidArgument, options[:args] unless options[:args].empty?

        options[:vault] ||= []

        specs_to_uninstall = Gem::Specification.reject { |spec| options[:vault].include?(spec.name) }

        specs_to_uninstall.each do |spec|
          begin
            Gem::Uninstaller.new(spec.name, {
                force: true,
                executables: true
            }).uninstall
          rescue StandardError
            # ignored
          end
        end
      end
    end
  end
end
