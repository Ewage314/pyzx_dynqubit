OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
z q[8];
z q[0];
cx q[5], q[1];
cx q[7], q[1];
cx q[8], q[3];
