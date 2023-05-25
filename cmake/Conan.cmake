set(CMAKE_CONAN_DOWNLOAD_VERSION develop2)

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan_provider.cmake")
    message(STATUS "Downloading conan_provider.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/${CMAKE_CONAN_DOWNLOAD_VERSION}/conan_provider.cmake"
                "${CMAKE_BINARY_DIR}/conan_provider.cmake"
                TLS_VERIFY ON)
endif()

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan_support.cmake")
    message(STATUS "Downloading conan_support.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/${CMAKE_CONAN_DOWNLOAD_VERSION}/conan_support.cmake"
                  "${CMAKE_BINARY_DIR}/conan_support.cmake"
                  TLS_VERIFY ON)
endif()

set(CMAKE_PROJECT_TOP_LEVEL_INCLUDES "${CMAKE_BINARY_DIR}/conan_provider.cmake" CACHE FILEPATH "" FORCE)

function(conan_install_conanfile CONANFILE_PATH)
    message(STATUS "Installing Conan packages from ${CONANFILE_PATH}")
    find_program(CONAN_EXECUTABLE conan)
    execute_process(COMMAND ${CONAN_EXECUTABLE} install ${CONANFILE_PATH} --build=missing
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                    RESULT_VARIABLE CONAN_INSTALL_RESULT)
    if(NOT ${CONAN_INSTALL_RESULT} EQUAL 0)
        message(FATAL_ERROR "Conan install failed with error code ${CONAN_INSTALL_RESULT}")
    endif()
endfunction()
