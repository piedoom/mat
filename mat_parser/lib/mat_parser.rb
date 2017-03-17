require_relative 'material'
require 'yaml'
require 'pathname'

module MatParser
    class Mat
        PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '../../'))
        
        # analyse currently open folder
        def analyse

            # get the directory the script was run from, create a new material
            material = Material.new

            # calculate the relative path
            material.path = Pathname.new(Pathname.new(Dir.pwd)).relative_path_from(Pathname.new(PROJECT_ROOT)).to_s
            
            # calculate the material fname
            material.name = material.path.split('/').last
            material.category = material.path.split('/')[-2]

            # loop over all files and add them to our folder object
            Dir.foreach(Dir.pwd) do |fname|
                next if fname == '.' or fname == '..'

                # check for manifest
                # if a yml file is already present, ask the user if they would like to continue
                if File.extname(fname) == ".yml"
                    puts "A manifest file for this material already exists.  Would you like to continue and overwrite this file? (y/n)"
                    if gets.downcase.chomp == "n"
                        puts "Exiting."
                        return
                    end 
                end 

                # extract special files/maps, etc.
                material.maps.diffuse = fname if fname =~ /diffuse/i
                material.maps.reflection = fname if fname =~ /reflection/i
                material.maps.roughness = fname if fname =~ /roughness/i
                material.maps.height = fname if fname =~ /height/i
                material.maps.normal = fname if fname =~ /normal/i
                
                material.thumb = fname if fname =~ /thumb/i
                material.blend = fname if File.extname(fname) == '.blend'
            end

            # confirm settings
            puts "\nHere is the generated YML for the material so far:\n"
            puts material.to_yaml
            puts "\n If something looks wrong, consider renaming your files. (automatic correction coming in the future!)\nPress enter to continue."
            gets
            puts "What is the primary color of this texture? (Please use general colors e.g. white, black instead of taupe or mustard)"
            material.color = gets.downcase.chomp 
            puts "Enter tags to describe this material, separated by spaces.  If multi-word, use a dash instead of a space.  
            Example tags: stone house nature animal grunge etc."
            material.tags = gets.downcase.chomp.split
            puts "Enter the author name/username"
            material.author = gets.chomp
            puts "Saving file..."
            File.open("#{material.name}.yml", 'w') {|f| f.write material.to_yaml}
        end

    end
end