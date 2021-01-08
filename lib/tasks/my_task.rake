namespace :enroll do

    desc 'Dummy rake task'
    task :participants, [:clinic, :no_of_participants ] => [:environment] do |t,args|
        puts args
        clinic=Clinic.find_by_name(args[:clinic])
        return 'Clinic not found ' unless clinic
        no_of_participants=args[:no_of_participants].to_i

        (0...no_of_participants).each do |n|
            begin
                participant=Participant.new(
                    name: "participant#{n}",
                    age: (10..100).to_a.sample,
                    gender: ['male','female'].sample
                )
                participant.save!
                puts "Participant created successflly !! #{participant.name}"
            rescue => e
                puts "Failed #{participant.errors.full_messages}"
            end
        end

        #assign participants to arms
        clinic.arms.each do |arm|
            (0...arm.limit).each do |n|
                begin
                participant=Participant.where(arm_id: nil).sample
                participant.arm=arm
                
                participant.save!
                p participant
                puts "Participant created successflly !! #{arm.name}"
            rescue => e
                puts "Failed #{participant.errors.full_messages}"
            end
            end
        end
    end
end


