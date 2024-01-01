#include <mbgl/util/logging.hpp>
#include <mbgl/util/enum.hpp>

#include <iostream>

#define FIXED_WIDTH_UINT(value) char((value) >> 24), char((value) >> 16), char((value) >> 8), char((value) >> 0)

namespace mbgl
{

  void Log::platformRecord(EventSeverity severity, const std::string &msg)
  {
    const std::string sev = Enum<EventSeverity>::toString(severity);
    const char length[4] = {FIXED_WIDTH_UINT(sev.size() + 2 + msg.size())};
    std::cout.write(length, 4);
    std::cout << sev << ": " << msg;
  }

} // namespace mbgl
