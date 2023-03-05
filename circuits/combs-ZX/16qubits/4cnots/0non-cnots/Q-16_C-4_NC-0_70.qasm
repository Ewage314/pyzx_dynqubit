OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[7];
cx q[7], q[9];
cx q[15], q[9];
cx q[11], q[1];
