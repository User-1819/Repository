program file_cloner
    use, intrinsic :: iso_fortran_env, only: int64
    implicit none

    integer(int64) :: number = 0
    integer(int64) :: number2 = 0
    integer(int64) :: number3 = huge(0_int64)
    
    call main()

contains

    subroutine main()
        character(len=*), parameter :: file = "File.txt"
        logical :: file_exists
        
        inquire(file=file, exist=file_exists)
        if (.not. file_exists) then
            open(unit=10, file=file, status='new')
            write(10, *) "Goodbye Cruel World!"
            close(10)
        end if
        
        print *, "WARNING! THIS A FILE CLONER! EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!"
        print *, "Press any key to continue..."
        read(*,*)
        
        call end_program()
    end subroutine main

    subroutine end_program()
        character(len=:), allocatable :: file, contents, file2
        integer :: io_status
        
        call execute_command_line("clear")
        
        file = "File.txt"
        open(unit=10, file=file, status='old', action='read', iostat=io_status)
        if (io_status == 0) then
            contents = read_file_contents(10)
            close(10)
        else
            print *, "Error reading file"
            return
        end if
        
        do number = 0, number3
            open(unit=10, file=file, status='old', position='append', action='write', iostat=io_status)
            if (io_status == 0) then
                write(10, '(a)', advance='no') contents
                close(10)
            else
                print *, "Error writing to file"
                return
            end if
            
            write(*, '(a, i0)', advance='no') char(13), number2 + 1
            call flush(6)
            
            write(file2, '(a, i0, a)') "File (", number2, ").txt"
            call execute_command_line("cp " // file // " " // file2)
            
            file = file2
            number2 = number2 + 1
        end do
        
        print *
    end subroutine end_program

    function read_file_contents(unit) result(contents)
        integer, intent(in) :: unit
        character(len=:), allocatable :: contents
        character(len=1024) :: buffer
        integer :: io_status
        
        contents = ""
        do
            read(unit, '(a)', iostat=io_status) buffer
            if (io_status /= 0) exit
            contents = contents // trim(buffer) // new_line('a')
        end do
    end function read_file_contents

end program file_cloner


