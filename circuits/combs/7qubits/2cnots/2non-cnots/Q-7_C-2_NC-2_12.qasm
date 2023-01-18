OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[4], q[3];
x q[5];
x q[2];
cx q[6], q[1];
