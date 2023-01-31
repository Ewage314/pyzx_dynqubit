OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[6], q[7];
x q[1];
z q[0];
cx q[3], q[2];
