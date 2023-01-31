OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[3];
cx q[6], q[1];
cx q[8], q[7];
z q[8];
cx q[7], q[0];
