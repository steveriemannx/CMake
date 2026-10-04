/* Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
   file LICENSE.rst or https://cmake.org/licensing for details.  */
#pragma once

#include <memory>
#include <string>

#include "cmGlobalGeneratorFactory.h"
#include "cmGlobalUnixMakefileGenerator3.h"

class cmake;

/** \class cmGlobalBSDMakefileGenerator
 * \brief Write BSD makefiles.
 *
 * cmGlobalBSDMakefileGenerator manages the BSD make (bmake) build process for
 * a tree.
 *
 * The makefile layout is shared with cmGlobalUnixMakefileGenerator3, but this
 * generator selects a BSD make, emits the BSD make ``.include`` directive, and
 * never relies on GNU make specific behavior (such as ``--output-sync`` or the
 * GNU make job server protocol).
 */
class cmGlobalBSDMakefileGenerator : public cmGlobalUnixMakefileGenerator3
{
public:
  cmGlobalBSDMakefileGenerator(cmake* cm);
  static std::unique_ptr<cmGlobalGeneratorFactory> NewFactory()
  {
    return std::unique_ptr<cmGlobalGeneratorFactory>(
      new cmGlobalGeneratorSimpleFactory<cmGlobalBSDMakefileGenerator>());
  }

  //! Get the name for the generator.
  std::string GetName() const override
  {
    return cmGlobalBSDMakefileGenerator::GetActualName();
  }
  static std::string GetActualName() { return "BSD Makefiles"; }

  /** Get the documentation entry for this generator.  */
  static cmDocumentationEntry GetDocumentation();

  /** BSD make does not implement the GNU make job server protocol.  Its own
      ``-J`` job server support is handled by cmUVJobServerClient instead.  */
  bool IsGNUMakeJobServerAware() const override { return false; }

  /** BSD make requires include file names to be delimited by "" or <>.  */
  std::string FormatIncludeDirective(std::string const& file) const override;
};
