module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
      include Enumerable
    end
  end
  
  module InstanceMethods
    attr_accessor :headers, :csv_contents
    
    def initialize
      read
    end
    
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.csv'
      file = File.new(filename)
      
      @headers = parse file.gets
            
      file.each do |row|
        @csv_contents << CsvRow.new(@headers, parse(row))
      end
    end
    
    def parse row
      row.chomp.split(', ')
    end
    
    def each &block
      @csv_contents.each &block
    end
        
    class CsvRow
      def initialize(headers, row)
        @headers = headers
        @row = row
      end
      
      def respond_to?(sym)
        @headers.index(name.to_s) || super(sym)
      end
      
      def method_missing name, *args, &block
        index = @headers.index(name.to_s)
        if index
          @row[index]
        else
          super
        end        
      end      
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect
puts "\n--------------Result--------------\n"
csv.each { |row| puts "#{row.Name}, #{row.Type}, #{row.Characteristics}" }