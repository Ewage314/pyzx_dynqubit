OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[4], q[5];
cx q[6], q[1];
