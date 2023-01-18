OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[0], q[7];
cx q[2], q[1];
cx q[3], q[2];
x q[3];
cx q[0], q[1];
cx q[5], q[6];
