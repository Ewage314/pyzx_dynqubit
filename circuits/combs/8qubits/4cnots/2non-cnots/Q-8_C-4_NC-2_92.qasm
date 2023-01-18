OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[2], q[7];
cx q[5], q[6];
x q[3];
cx q[3], q[7];
x q[0];
cx q[7], q[2];
