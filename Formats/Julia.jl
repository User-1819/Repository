using Base.Filesystem

# Global variables
const Number = Ref{UInt64}(0)
const Number2 = Ref{UInt64}(0)
const Number3 = typemax(UInt64)

function main()
    file = "File.txt"
    if !isfile(file)
        write(file, "Goodbye Cruel World!")
    end
    println("WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!")
    readline()
    ending()
end

function ending()
    run(`clear`)
    file = "File.txt"
    contents = read(file, String)
    
    for Number[] = 0:Number3-1
        write(file, contents, append=true)
        print("\r$(Number2[] + 1)")
        run(`printf '\033]0;%s\007' "$(Number2[] + 1)"`)  # Set console title
        flush(stdout)
        file2 = "File ($(Number2[])).txt"
        cp(file, file2)
        file = file2
        Number2[] += 1
    end
    println()
end

main()


