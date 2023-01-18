OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[3];
cx q[6], q[9];
