OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[7];
cx q[0], q[6];
x q[3];
cx q[7], q[3];
cx q[6], q[1];
