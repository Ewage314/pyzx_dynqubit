OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
z q[7];
z q[1];
cx q[6], q[0];
cx q[0], q[7];
