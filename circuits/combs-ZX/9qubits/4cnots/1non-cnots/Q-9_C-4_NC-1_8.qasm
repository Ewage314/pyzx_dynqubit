OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[8];
cx q[8], q[2];
z q[6];
cx q[8], q[0];
cx q[8], q[3];
