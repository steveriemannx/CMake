/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file LICENSE.rst or https://cmake.org/licensing for details.  */
#include "cmGlobalBSDMakefileGenerator.h"

#include "cmStringAlgorithms.h"

cmGlobalBSDMakefileGenerator::cmGlobalBSDMakefileGenerator(cmake* cm)
  : cmGlobalUnixMakefileGenerator3(cm)
{
  this->FindMakeProgramFile = "CMakeBSDFindMake.cmake";
  // Use the BSD make ``.include`` directive instead of the GNU make
  // ``include`` spelling, which BSD make only accepts as a synonym.
  this->IncludeDirective = ".include";
}

std::string cmGlobalBSDMakefileGenerator::FormatIncludeDirective(
  std::string const& file) const
{
  // BSD make requires the file name to be delimited by "" or <>.
  return cmStrCat(this->IncludeDirective, " \"", file, '"');
}

cmDocumentationEntry cmGlobalBSDMakefileGenerator::GetDocumentation()
{
  return { cmGlobalBSDMakefileGenerator::GetActualName(),
           "Generates BSD makefiles." };
}
