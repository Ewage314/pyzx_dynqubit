OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[7], q[4];
cx q[5], q[8];
cx q[8], q[7];
cx q[0], q[9];
