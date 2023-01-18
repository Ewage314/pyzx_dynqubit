OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[6], q[0];
cx q[6], q[4];
