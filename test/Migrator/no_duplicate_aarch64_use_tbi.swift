// REQUIRES: OS=ios
// REQUIRES: CPU=arm64
// RUN: %target-swift-frontend -typecheck %s -swift-version 3
// RUN: %empty-directory(%t)
// RUN: cd %t && %target-swiftc_driver -c -update-code -output-file-map %S/Inputs/no_duplicate_aarch64_use_tbi_ofm.json -swift-version 3 %s -v
// RUN: cd %t && %target-swiftc_driver -c -update-code -output-file-map %S/Inputs/no_duplicate_aarch64_use_tbi_ofm.json -swift-version 3 %s -### > %t/driver_actions.txt
// RUN: %FileCheck --check-prefix=CHECK-REMAP %s < %t/no_duplicate_aarch64_use_tbi.remap
// RUN: %FileCheck --check-prefix=CHECK-ACTIONS %s < %t/driver_actions.txt

public func foo(_ f: (Void) -> ()) {}

// CHECK-REMAP: "offset": 632,
// CHECK-REMAP: "remove": 5,
// CHECK-REMAP: "text": "("

// CHECK-ACTIONS: -Xllvm -aarch64-use-tbi
