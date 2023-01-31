OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[4];
cx q[6], q[5];
cx q[4], q[9];
cx q[5], q[4];
cx q[1], q[6];
