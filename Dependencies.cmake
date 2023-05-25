include(cmake/Conan.cmake)

conan_install_conanfile(${CMAKE_CURRENT_SOURCE_DIR}/conanfile.txt)

find_package(fmt CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)
find_package(Catch2 CONFIG REQUIRED)
find_package(CLI11 CONFIG REQUIRED)
find_package(ftxui CONFIG   REQUIRED)
