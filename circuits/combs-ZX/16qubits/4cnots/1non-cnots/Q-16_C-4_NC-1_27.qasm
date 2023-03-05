OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
z q[8];
cx q[6], q[1];
cx q[11], q[1];
cx q[10], q[9];
