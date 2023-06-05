add_executable(intro main.cpp)

find_package(CLI11 CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)
find_package(ftxui CONFIG REQUIRED)
find_package(lefticus-tools CONFIG REQUIRED)

target_link_libraries(
  intro
  PRIVATE myproject::myproject_options
          myproject::myproject_warnings)

target_link_system_libraries(
  intro
  PRIVATE
          CLI11::CLI11
          fmt::fmt
          spdlog::spdlog
          lefticus::tools
          ftxui::screen
          ftxui::dom
          ftxui::component)

target_include_directories(intro PRIVATE "${CMAKE_BINARY_DIR}/configured_files/include")
