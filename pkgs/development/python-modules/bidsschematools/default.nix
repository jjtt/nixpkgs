{
  lib,
  buildPythonPackage,
  pythonOlder,
  fetchPypi,
  setuptools,
  click,
  pyyaml,
  jsonschema,
}:

buildPythonPackage rec {
  pname = "bidsschematools";
  version = "0.11.3";
  pyproject = true;

  disabled = pythonOlder "3.9";

  src = fetchPypi {
    pname = "bidsschematools";
    inherit version;
    hash = "sha256-GvR3pOXXmdpjH2xdL+trhLW6ZdsTpEWUdNUlVQ4gFXo=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    click
    pyyaml
    jsonschema
  ];

  pythonImportsCheck = [
    "bidsschematools"
  ];

  meta = {
    description = "Python tools for working with the BIDS schema";
    homepage = "https://github.com/bids-standard/bids-specification/tree/master/tools/schemacode";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ wegank ];
  };
}
