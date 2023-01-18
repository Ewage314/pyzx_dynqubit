OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[3];
cx q[1], q[7];
cx q[4], q[7];
cx q[3], q[2];
cx q[3], q[1];
