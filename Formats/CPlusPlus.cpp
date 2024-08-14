#include <iostream>#include <fstream>
#include <string>
#include <limits>
#include <cstdint>
#include <filesystem>

class Program
{
public:
    static uint64_t Number;
    static uint64_t Number2;
    static uint64_t Number3;

    static void Main(int argc, char* argv[])
    {
        std::string file = "File.txt";
        if (!std::filesystem::exists(file))
        {
            std::ofstream outFile(file);
            outFile << "Goodbye Cruel World!";
            outFile.close();
        }
        std::cout << "WARNING! THIS A FILE CLONER! "
                  << "EXECUTING THIS WILL RESULT IN A FILE OVERLOAD!" << std::endl;
        std::cin.get();
        Program::End();
    }

    static void End()
    {
        system("cls");
        std::string File = "File.txt";
        std::string contents;
        std::ifstream inFile(File);
        std::getline(inFile, contents, '\0');
        inFile.close();

        for (Number = 0; Number < Number3; Number2++)
        {
            std::ofstream outFile(File, std::ios_base::app);
            outFile << contents;
            outFile.close();

            std::cout << '\r' << (Number2 + 1);
            std::cout.flush();

            std::string File2 = "File (" + std::to_string(Number2) + ").txt";
            std::filesystem::copy_file(File, File2, std::filesystem::copy_options::overwrite_existing);
            File = File2;
        }
        std::cout << std::endl;
    }
};

uint64_t Program::Number = 0;
uint64_t Program::Number2 = 0;
uint64_t Program::Number3 = std::numeric_limits<uint64_t>::max();

int main(int argc, char* argv[])
{
    Program::Main(argc, argv);
    return 0;
}