OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[2], q[3];
x q[6];
cx q[5], q[4];
cx q[7], q[6];
cx q[3], q[7];
cx q[5], q[3];
